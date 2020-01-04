## Вводная
baseUrl: https://snp-tests.herokuapp.com/api/v1/

headers:

| Параметр  | Описание |
| ------------- | ------------- |
| scope-key  | Уникальный хэш. Нужен, чтобы разделить данные между пользователями API. Сгенерировать можно, например, здесь http://md5.my-addr.com/online_random_md5_hash_generator-and-md5_random_hash.php или запросить у своего ментора  |
| token  | Токен пользователя. Нужен для большинства запросов. Получить можно в ответе на авторизацию или регистрацию |

## Регистрация
post: /signup

| Параметр  | Тип |
| ------------- | ------------- |
| username  | string |
| password  | string |
| password_confirmation  | string |
| is_admin  | boolean |


## Авторизация
post: /signin

| Параметр  | Тип |
| ------------- | ------------- |
| username  | string |
| password  | string |

## Получение юзера по токену
get: /users/current

## Создание теста
post: /tests

| Параметр  | Тип |
| ------------- | ------------- |
| title  | string |

## Редактирование теста
patch: /tests/:id

## Удаление теста
delete: /tests/:id

## Получение теста
get: /tests/:id/

## Получение списка тестов с пагинацией
get: /tests

| Параметр  | Тип | default | Описание |
| ------------- | ------------- | ------------- | ------------- | 
| page  | number | 1 | страница | 
| per  | number | 5 | количество элементов на странице |
| search  | string |  | поиск по title, неполное вхождение, не зависит от регистра |

## Создание вопроса
post: /tests/:test_id/questions

| Параметр  | Тип |
| ------------- | ------------- |
| title  | string |  |
| question_type  | string ('single', 'multiple', 'number') |
| answer  | number |

## Редактирование вопроса
patch: /questions/:id

## Удаление вопроса
delete: /questions/:id

## Создание ответа
post: /questions/:question_id/answers

| Параметр  | Тип |
| ------------- | ------------- |
| text  | string |  |
| is_right  | boolean |

## Редактирование ответа
patch: /answers/:id

## Перемещение ответа
patch: /answers/:id/insert_at/:position

## Удаление ответа
delete: /answers/:id









