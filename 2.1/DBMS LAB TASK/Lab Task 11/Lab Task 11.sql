1.

CREATE PROCEDURE CALCULATE_MOVIE_TIME(
    p_mov_title IN VARCHAR2,
    p_total_time OUT VARCHAR2
) AS
    v_total_time NUMBER;
    v_remaining_time NUMBER;
    v_intermission NUMBER := 15;
    v_hours NUMBER;
    v_minutes NUMBER;
BEGIN
    
    SELECT SUM(MOV_TIME) INTO v_total_time
    FROM MOVIE
    WHERE MOV_TITLE = p_mov_title;

    
    IF v_total_time IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Movie not found.');
        RETURN;
    END IF;

   
    v_remaining_time := v_total_time;
    WHILE v_remaining_time > 30 LOOP
        v_remaining_time := v_remaining_time - 70;
        v_remaining_time := GREATEST(v_remaining_time, 0);
        v_total_time := v_total_time + v_intermission;
    END LOOP;

    
    v_hours := TRUNC(v_total_time / 60);
    v_minutes := MOD(v_total_time, 60);

   
    p_total_time := v_hours || ' hours ' || v_minutes || ' minutes';
    DBMS_OUTPUT.PUT_LINE('Required time to play "' || p_mov_title || '": ' || p_total_time);
END CALCULATE_MOVIE_TIME;
/


DECLARE
    v_total_time VARCHAR2(50);
BEGIN
    CALCULATE_MOVIE_TIME('The Shawshank Redemption', v_total_time);
END;
/


2.

CREATE PROCEDURE TOP_RATED_MOVIES_FIND(
    p_n IN NUMBER
) AS
    v_movie_title VARCHAR2(50);
    v_row_counter NUMBER := 0;
BEGIN
    DECLARE
        v_total_movies NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total_movies
        FROM MOVIE;

        IF p_n > v_total_movies THEN
            DBMS_OUTPUT.PUT_LINE('Error: N is greater than the total number of movies.');
            RETURN;
        END IF;
    END;
    FOR movie_rec IN (
        SELECT m.MOV_TITLE
        FROM MOVIE m
        JOIN RATING r ON m.MOV_ID = r.MOV_ID
        GROUP BY m.MOV_TITLE
        ORDER BY AVG(r.REV_STARS) DESC
    ) LOOP
        v_row_counter := v_row_counter + 1;
        EXIT WHEN v_row_counter > p_n;
        DBMS_OUTPUT.PUT_LINE(movie_rec.MOV_TITLE);
    END LOOP;
END TOP_RATED_MOVIES_FIND;
/



BEGIN
    TOP_RATED_MOVIES_FIND(8); 
END;
/

3.


CREATE OR REPLACE FUNCTION CALCULATE_YEARLY_EARNING(
    p_mov_id IN NUMBER
) RETURN NUMBER IS
    v_total_earning NUMBER := 0;
    v_total_reviews NUMBER := 0;
    v_release_date DATE;
    v_current_date DATE := SYSDATE;
BEGIN
    SELECT MOV_RELEASEDATE INTO v_release_date
    FROM MOVIE
    WHERE MOV_ID = p_mov_id;
    IF v_release_date IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Movie not found.');
        RETURN NULL;
    END IF;
    
    SELECT SUM(CASE WHEN REV_STARS >= 6 THEN 10 ELSE 0 END) AS total_earning,
           COUNT(*) AS total_reviews
    INTO v_total_earning, v_total_reviews
    FROM RATING
    WHERE MOV_ID = p_mov_id;

    IF v_total_reviews = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No reviews available for the movie.');
        RETURN NULL;
    END IF;

    v_total_earning := v_total_earning * 12 / MONTHS_BETWEEN(v_current_date, v_release_date);

    RETURN v_total_earning;
END CALCULATE_YEARLY_EARNING;
/



DECLARE
    v_earning NUMBER;
BEGIN
    v_earning := CALCULATE_YEARLY_EARNING(910); 
    IF v_earning IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Yearly earning for the movie: $' || TO_CHAR(v_earning));
    END IF;
END;
/

4.

CREATE OR REPLACE FUNCTION GENRE_STATUS_FIND(GENRE_ID IN NUMBER)
RETURN VARCHAR2
IS
    GENRE_STATUS VARCHAR2(50);
    GENRE_REVIEW_COUNT NUMBER;
    GENRE_AVG_RATING NUMBER;
    MOVIE_COUNT NUMBER;
    MOVIE_AVG_RATING NUMBER;
    MOVIE_REVIEW_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO MOVIE_COUNT FROM MOVIE;
    SELECT AVG(REV_STARS) INTO MOVIE_AVG_RATING FROM RATING;
    SELECT COUNT(*) INTO MOVIE_REVIEW_COUNT FROM RATING;
    SELECT COUNT(*) INTO GENRE_REVIEW_COUNT FROM RATING WHERE MOV_ID IN (SELECT MOV_ID FROM MTYPE WHERE GEN_ID = GENRE_ID);
    SELECT AVG(REV_STARS) INTO GENRE_AVG_RATING FROM RATING WHERE MOV_ID IN (SELECT MOV_ID FROM MTYPE WHERE GEN_ID = GENRE_ID);
    IF GENRE_REVIEW_COUNT > MOVIE_REVIEW_COUNT/MOVIE_COUNT AND GENRE_AVG_RATING < MOVIE_AVG_RATING THEN
        GENRE_STATUS := 'Widely Watched';
    ELSIF GENRE_REVIEW_COUNT < MOVIE_REVIEW_COUNT/MOVIE_COUNT AND GENRE_AVG_RATING > MOVIE_AVG_RATING THEN
        GENRE_STATUS := 'Highly Rated';
    ELSIF GENRE_REVIEW_COUNT > MOVIE_REVIEW_COUNT/MOVIE_COUNT AND GENRE_AVG_RATING > MOVIE_AVG_RATING THEN
        GENRE_STATUS := 'People''s Favorite';
    ELSE
        GENRE_STATUS := 'So So';
    END IF;
    RETURN GENRE_STATUS_FIND;
END;
/


5.

CREATE OR REPLACE FUNCTION MOST_FGENRE(DATE1 IN DATE, DATE2 IN DATE)
RETURN SYS_REFCURSOR
IS
    RESULT SYS_REFCURSOR;
BEGIN
    OPEN RESULT FOR
    SELECT * FROM (
        SELECT GEN_ID, COUNT(*) AS MOVIE_COUNT
        FROM MOVIE
        JOIN MTYPE ON MOVIE.MOV_ID = MTYPE.MOV_ID
        WHERE MOV_RELEASEDATE BETWEEN DATE1 AND DATE2
        GROUP BY GEN_ID
        ORDER BY MOVIE_COUNT DESC
    ) WHERE ROWNUM = 1;
    RETURN RESULT;
END;
/


DECLARE
    RESULT SYS_REFCURSOR;
    GEN_ID NUMBER;
    MOVIE_COUNT NUMBER;
BEGIN
    RESULT := MOST_FREQUENT_GENRE(TO_DATE('1986-08-29', 'YYYY-MM-DD'), TO_DATE('2009-01-09', 'YYYY-MM-DD'));
    FETCH RESULT INTO GEN_ID, MOVIE_COUNT;
    DBMS_OUTPUT.PUT_LINE('Genre ID: ' || GEN_ID || ', Movie Count: ' || MOVIE_COUNT);
    CLOSE RESULT;
END;
