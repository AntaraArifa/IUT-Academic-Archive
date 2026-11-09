1.

(a)
set serveroutput on

begin
    dbms_output.put_line('Antara Arifa Mullick');
end;
/

(b)
set serveroutput on

declare
    s_id number;
begin
    s_id := '&s_id';
    dbms_output.put_line('Student id is: '|| s_id ||' and its length is: '|| length(s_id));
end;
/

(c)
set serveroutput on

declare
    val_1 number;
    val_2 number;
begin
    val_1 := '&val_1';
    val_2 := '&val_2';
    dbms_output.put_line('The product of ' || val_1 ||' and '|| val_2 ||' is: '|| (val_1*val_2));
end;
/

(d) 
set serveroutput on

declare
    current_time varchar2(20);
begin
    select to_char(sysdate, 'HH:MI:SS AM') into current_time from dual;
    dbms_output.put_line('Current Time (12-hour format): '|| current_time);
end;
/

(e) 
set serveroutput on

declare
    val number;
begin
    val := '&val';
    if mod(val, 1) = 0 then
        dbms_output.put_line('The number is a whole');
    else
        dbms_output.put_line('The number is a fraction');
    end if;
end;
/

(f)
set serveroutput on

create or replace procedure composite_number_check (p_num in number) is
    v_count number;
begin
    select count(*) into v_count from dual where mod(p_num, 2) = 0;
    if v_count > 0 then
        dbms_output.put_line('The number is a composite number');
    else
        dbms_output.put_line('The number is not a composite number');
    end if;
end;
/

begin
    composite_number_check(7);
end;
/

2.

(a)
set serveroutput on

CREATE OR REPLACE PROCEDURE fetchTopRatedFilms(num IN NUMBER) AS
BEGIN
    FOR film_data IN (
        SELECT title, avg_rating
        FROM (
            SELECT MOVIE.MOV_TITLE AS title, RATING.MOV_ID, AVG(REV_STARS) AS avg_rating
            FROM RATING
            INNER JOIN MOVIE ON RATING.MOV_ID = MOVIE.MOV_ID
            GROUP BY RATING.MOV_ID, MOV_TITLE
            ORDER BY AVG(REV_STARS) DESC
        )
        WHERE ROWNUM <= num
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Film: ' || film_data.title);
        DBMS_OUTPUT.PUT_LINE('Average Rating: ' || film_data.avg_rating);
    END LOOP;
END fetchTopRatedFilms;
/

BEGIN
    fetchTopRatedFilms(2);
END;
/


(b)
set serveroutput on

CREATE OR REPLACE FUNCTION get_movie_status(p_movie_title VARCHAR2) RETURN VARCHAR2 IS
    v_actor_count NUMBER;
    v_status VARCHAR2(20);
BEGIN
    -- This query counts the number of actors/actresses for the given movie title
    SELECT COUNT(*) INTO v_actor_count
    FROM CASTS
    WHERE MOV_ID = (SELECT MOV_ID FROM MOVIE WHERE MOV_TITLE = p_movie_title);

    -- Determine the status based on the actor count
    IF v_actor_count = 1 THEN
        v_status := 'Solo';
    ELSE
        v_status := 'Ensemble';
    END IF;

    -- Return the status
    RETURN v_status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle the case where the movie title is not found
        RETURN 'Movie not found';
    WHEN OTHERS THEN
        -- Handle other exceptions
        RETURN 'Error';
END get_movie_status;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(get_movie_status('The Shawshank Redemption'));
END;
/

(c)
set serveroutput on

CREATE OR REPLACE PROCEDURE fetchOscarNominees AS
BEGIN
    FOR nominee_data IN (
        SELECT DISTINCT DIRECTOR.DIR_FIRSTNAME || ' ' || DIRECTOR.DIR_LASTNAME AS nominee_name
        FROM DIRECTOR
        INNER JOIN DIRECTION ON DIRECTOR.DIR_ID = DIRECTION.DIR_ID
        INNER JOIN MOVIE ON DIRECTION.MOV_ID = MOVIE.MOV_ID
        INNER JOIN RATING ON MOVIE.MOV_ID = RATING.MOV_ID
        GROUP BY DIRECTOR.DIR_FIRSTNAME, DIRECTOR.DIR_LASTNAME
        HAVING AVG(REV_STARS) >= 7 AND COUNT(*) > 10
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nominee: ' || nominee_data.nominee_name);
    END LOOP;
END fetchOscarNominees;
/

BEGIN
    fetchOscarNominees;
END;
/


(d)
set serveroutput on

CREATE OR REPLACE FUNCTION get_movie_category(p_movie_title VARCHAR2) RETURN VARCHAR2 IS
    v_release_year NUMBER;
    v_avg_rating NUMBER;
    v_category VARCHAR2(20);
BEGIN
    -- This query gets the release year and average rating for the given movie title
    SELECT MOVIE.MOV_YEAR, AVG(REV_STARS) INTO v_release_year, v_avg_rating
    FROM MOVIE
    INNER JOIN RATING ON MOVIE.MOV_ID = RATING.MOV_ID
    WHERE MOV_TITLE = p_movie_title
    GROUP BY MOVIE.MOV_YEAR;

    -- Determine the category based on the release year and average rating
    IF v_release_year BETWEEN 1950 AND 1959 AND v_avg_rating > 6.5 THEN
        v_category := 'Fantastic Fifties';
    ELSIF v_release_year BETWEEN 1960 AND 1969 AND v_avg_rating > 6.7 THEN
        v_category := 'Sweet Sixties';
    ELSIF v_release_year BETWEEN 1970 AND 1979 AND v_avg_rating > 6.9 THEN
        v_category := 'Super Seventies';
    ELSIF v_release_year BETWEEN 1980 AND 1989 AND v_avg_rating > 7.1 THEN
        v_category := 'Ecstatic Eighties';
    ELSIF v_release_year BETWEEN 1990 AND 1999 AND v_avg_rating > 7.3 THEN
        v_category := 'Neat Nineties';
    ELSE
        v_category := 'Garbage';
    END IF;

    -- Return the category
    RETURN v_category;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle the case where the movie title is not found
        RETURN 'Movie not found';
    WHEN OTHERS THEN
        -- Handle other exceptions
        RETURN 'Error';
END get_movie_category;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(get_movie_category('The Shawshank Redemption'));
END;
/