const mockData =
    '{\r\n  \"users\":[\r\n            {  \"id\":1,\r\n        \"username\":\"user1\",\r\n        \"password\":\"pass1\"\r\n              \r\n            },\r\n            {  \"id\":2,\r\n        \"username\":\"user2\",\r\n        \"password\":\"pass2\"\r\n              \r\n            },\r\n            {  \"id\":3,\r\n        \"username\":\"user3\",\r\n        \"password\":\"pass3\"\r\n              \r\n            },\r\n            {  \"id\":4,\r\n        \"username\":\"user4\",\r\n        \"password\":\"pass4\"\r\n              \r\n            }\r\n            \r\n          ],\r\n  \"categories\":[\r\n    {\r\n      \"id\":1,\r\n      \"name\":\"CAT-1\"\r\n      \r\n    },\r\n    {\r\n      \"id\":2,\r\n      \"name\":\"CAT-2\"\r\n      \r\n    },\r\n    {\r\n      \"id\":3,\r\n      \"name\":\"CAT-3\"\r\n      \r\n    }\r\n    \r\n    ] ,       \r\n  \"movies\":[\r\n    \r\n      {\r\n        \"id\":1,\r\n        \"userId\":1,\r\n        \"name\":\"MOV-1\",\r\n        \"category\":\r\n                     {\r\n                        \"id\":1,\r\n                      \"name\":\"CAT-1\"\r\n                     }\r\n                  \r\n                  \r\n      },\r\n         {\r\n        \"id\":2,\r\n        \"userId\":2,\r\n        \"name\":\"MOV-2\",\r\n        \"category\":\r\n                     {\r\n                        \"id\":1,\r\n                      \"name\":\"CAT-1\"\r\n                     }\r\n                    \r\n                  \r\n      },\r\n       {\r\n        \"id\":3,\r\n        \"userId\":2,\r\n        \"name\":\"MOV-3\",\r\n        \"category\":\r\n                     {\r\n                        \"id\":2,\r\n                      \"name\":\"CAT-2\"\r\n                     }\r\n                    \r\n                  \r\n      }\r\n    \r\n    ]        \r\n            \r\n}';

const debugLock = true;