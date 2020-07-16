## Вводная
baseUrl: https://snp-tests.herokuapp.com/api/v1/

headers:

| Параметр  | Описание |
| ------------- | ------------- |
| scope-key  | Уникальная строка. Нужна, чтобы разделить данные между пользователями API. Сгенерировать можно, например, здесь https://passwordsgenerator.net/ или запросить у своего ментора  |

Если у вас возникли вопросы, проверьте нет ли ответов [здесь](#faq)

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

## Получение текущего юзера
get: /users/current

## Logout
delete: /logout

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
| sort  | string | created_at_desc | сортировка. Может быть created_at_asc или created_at_desc |

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

# FAQ
### Я авторизовался и все равно получаю ошибку "Authentication is required to perfom this request"
Добавьте withCredentials = true
Если используете axios это можно сделать так:
```
import axios from 'axios';
axios.defaults.withCredentials = true;
```
После этого заного авторизуйтесь

### Локально у меня все работает, но после деплоя запросы не проходят.
Сообщите об этом ментору и напишите адрес сайта.
