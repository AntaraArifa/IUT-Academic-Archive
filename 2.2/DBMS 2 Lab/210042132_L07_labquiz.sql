--Task 1

SET SERVEROUTPUT ON;

DECLARE
   set_name VARCHAR2(20);
BEGIN
   
   set_name := 'Antara Arifa Mullick';
  
   DBMS_OUTPUT.PUT_LINE('Set Name: ' || set_name);
END;
/


--Task 2

SELECT 
    mov.mov_country,
    gen.gen_title AS most_frequent_genre
FROM 
    (SELECT 
        mov.mov_country,
        gen.gen_title AS most_frequent_genre,
        ROW_NUMBER() OVER (PARTITION BY mov.mov_country ORDER BY COUNT(*) DESC) AS genre_rank
    FROM 
        movie mov
    JOIN 
        mtype ON mov.mov_id = mtype.mov_id
    JOIN 
        genres gen ON mtype.gen_id = gen.gen_id
    GROUP BY 
        mov.mov_country, 
        gen.gen_title
    ) rankedgenres
WHERE 
    genre_rank = 1;


--Task 3

SELECT 
    director_first_name,
    director_last_name
FROM 
    (SELECT 
        d.DIR_FIRSTNAME AS director_first_name,
        d.DIR_LASTNAME AS director_last_name,
        AVG(r.REV_STARS) AS avg_rating,
        ROW_NUMBER() OVER (ORDER BY AVG(r.REV_STARS) DESC) AS rn
    FROM 
        DIRECTOR d
    JOIN 
        DIRECTION di ON d.DIR_ID = di.DIR_ID
    JOIN 
        MOVIE m ON di.MOV_ID = m.MOV_ID
    JOIN 
        RATING r ON m.MOV_ID = r.MOV_ID
    GROUP BY 
        d.DIR_FIRSTNAME, 
        d.DIR_LASTNAME) ranked
WHERE 
    rn IN (2, 3, 5);

--Task 4

CREATE OR REPLACE FUNCTION GetTopRatedActorsByYear(
    p_year IN NUMBER,
    p_n IN NUMBER
) RETURN SYS_REFCURSOR IS
    v_mean_rating NUMBER;
    v_cursor SYS_REFCURSOR;
BEGIN
    
    SELECT AVG(avg_rating)
    INTO v_mean_rating
    FROM (
        SELECT AVG(r.REV_STARS) AS avg_rating
        FROM MOVIE m
        JOIN CASTS c ON m.MOV_ID = c.MOV_ID
        JOIN RATING r ON m.MOV_ID = r.MOV_ID
        WHERE EXTRACT(YEAR FROM m.MOV_RELEASEDATE) = p_year
        GROUP BY c.ACT_ID
    );

    
    OPEN v_cursor FOR
        SELECT a.ACT_FIRSTNAME, a.ACT_LASTNAME
        FROM (
            SELECT 
                c.ACT_ID,
                AVG(r.REV_STARS) AS avg_rating
            FROM MOVIE m
            JOIN CASTS c ON m.MOV_ID = c.MOV_ID
            JOIN RATING r ON m.MOV_ID = r.MOV_ID
            WHERE EXTRACT(YEAR FROM m.MOV_RELEASEDATE) = p_year
            GROUP BY c.ACT_ID
            HAVING AVG(r.REV_STARS) > v_mean_rating
            ORDER BY AVG(r.REV_STARS) DESC
        ) top_actors
        JOIN ACTOR a ON top_actors.ACT_ID = a.ACT_ID
        WHERE ROWNUM <= p_n;

    
    RETURN v_cursor;
END;
/


--Task 6

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER SUGGEST_RATING
BEFORE INSERT OR UPDATE ON RATING
FOR EACH ROW
DECLARE
    -- Define the weights
    v_weight_sm CONSTANT NUMBER := 0.23;
    v_weight_sg CONSTANT NUMBER := 0.18;
    v_weight_asm CONSTANT NUMBER := 0.32;
    v_weight_asg CONSTANT NUMBER := 0.27;

    v_suggested_rating NUMBER;
BEGIN
   
    :NEW.REV_STARS := v_suggested_rating;
END;
/
