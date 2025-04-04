-- 여러 테이블을 조합해서 봐야하는 상황/ 특정 유저가 작성한 게시물을 볼거임 / 유저 테이블과 스코어 테이블을 같이 봐야 하는 상황 = 테이블을 확장
-- 1번 유저가 작성한 모든 점수(scores))
-- user = User.objects.get(id=1)
-- user.score_set.all()
-- Score.objects.filter(user_id=1)

SELECT * 
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
WHERE movies_user.id=1;

-- 100번 영화가 어떤 카테고리인지 = 3개의 테이블을 연결해야 함
-- Movie.objects.get(id=100).categories.all()
SELECT *
FROM movies_movie JOIN movies_category_movies  -- 합칠 테이블 2개
ON movies_movie.id = movies_category_movies.movie_id --기준 제시
JOIN movies_category --테이블 1개 추가
ON movies_category_movies.category_id = movies_category.id --추가 기준
WHERE movies_movie.id = 100; --100번 영화 찾기

-- drama 카테고리에 속한 모든 영화 출력
-- Category.objects.get(name='drama').movies.all()
SELECT *
FROM movies_category JOIN movies_category_movies
ON movies_category.id = movies_category_movies.category_id
JOIN movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name = 'drama';

-- group by
-- User.objects.values('country').annotate(Count('id'))
SELECT country, COUNT(*) FROM movies_user
GROUP BY COUNTRY;

-- 각각 나라, 평균점수 보고싶음
-- User.objects.values('country').annotate(Avg('score__value'))
SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
GROUP BY country;