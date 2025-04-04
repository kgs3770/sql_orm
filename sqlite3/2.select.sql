-- Movie.object.all =모든 영화 데이터 
SELECT * FROM movies_movie;
-- User.object.all =모든 유저 데이터
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('year') =연도순으로 정렬
SELECT * FROM movies_movie
ORDER BY year;

-- Movie.objects.all().order_by('-year') =역순으로 정렬
SELECT * FROM movies_movie
ORDER BY year DESC;

-- User.objects.filter(age=31) =나이가 31인 사람 선택
SELECT * FROM movies_user
WHERE age=31;

-- User.objects.filter(age__lt=20) =20살 아래인 사람
SELECT * FROM movies_user
WHERE age<20;

-- User.objects.filter(age__gte=20, age__lt=30) =나이가 20이상 30이하(2가지 조건을 입력)
SELECT * FROM movies_user
WHERE age > 20 AND age < 30;

-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
SELECT * FROM movies_movie
WHERE year <2000 OR year > 2010;

-- Movie.objects.aggregate(MAX('year')) =최근 개봉작 출력
SELECT TITLE, MAX(year) FROM movies_movie;

-- User.objects.aggregate(Avg('age')) =나이 평균값
SELECT AVG(age) FROM movies_user;

-- Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value')) =1번영화의 평균평점, 최고점
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1;

-- len(Score.objects.filter(user_id=1)) =1번 유저의 평점 작성 수
-- Score.objects.filter(user_id=1).count()
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;


-- Movie.objects.filter(title__contains='the') =이름에 the가 포함된 영화 검색
SELECT * FROM movies_movie
WHERE title LIKE '%the%';

-- Movie.objects.filter(title__startswith='the') =이름이 the로 시작하는 영화
SELECT * FROM movies_movie
WHERE title LIKE 'the%';

-- Movie.objects.filter(title__endswith='on.') =on으로 끝나는
SELECT * FROM movies_movie
WHERE title LIKE '%on.';

-- 이름에 g--d가 있는
-- ORM에서 사용하려면 정규표현식을 사용해야 합니다.
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

--User.objects.values('contry').distinct().count =중복 제거 후 카운트
SELECT COUNT(DISTINCT country) FROM movies_user;

-- User.objects.filter(age__range=[20, 29]) =나이 20-29인 유저 출력
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- Movie.objects.filter(year__in=[2000, 2005, 2010]) =개봉년도가 2000, 2005, 2010인 영화 출력
SELECT * FROM movies_movie
WHERE year IN (2000, 2005, 2010);