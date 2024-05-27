# Big oh tech - Task

- ### Node.js and MySQL Form API

## Table of Contents

- [Requirements](#requirements)
- [Setup](#setup)
- [APIs](#apis)
  - [POST /form](#post-form)
  - [POST /form_fill](#post-form_fill)
  - [GET /fill_data](#get-fill_data)

## Requirements

- Node.js
- MySQL

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/pankajpal2328/bigohtech.git
    cd bigohtech
    ```

2. Install dependencies:
    ```sh
    npm install
    ```

3. Configure MySQL database:
    - Import `bigohtech.sql` file in your MySQL database.

4. Run the application:
    ```sh
    node index.js
    ```

## APIs

### POST /form

Submit a new form entry.

#### URL and Body

```sh
POST /form
Body
{
    "uniqueId": "29ecc932-66d9-4f8b-924a-a3cd198b69db",
    "title": "user",
    "name": "Pankaj",
    "email": "pankaj2211@gmail.com",
    "phonenumber": 91358568585,
    "isGraduate": true
}
 ```

### POST /form_fill?form_title="user2"

Submit a new form entry trough title in query parameter.

#### URL and Body
```sh
POST /form_fill?form_title=user2
Body
{
    "uniqueId": "eb453acf-7696-40c1-a059-ad3d387cf900",
    "name": "Jane Doe",
    "email": "jane.doe@example.com",
    "phonenumber": 2345678901,
    "isGraduate": false
}
 ```

### GET /fill_data?form_title="user2"

Get all related data through title parameter in URL.

#### URL and Body
```sh
GET /fill_data?form_title=user2
 ```

