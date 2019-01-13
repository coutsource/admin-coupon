### Install

```
source database/admin.sql
cp .env.example .env
php artisan key:generate
composer install
npm install
```

### StartUp

```
npm run watch
php -S 127.0.0.1:7663 -t public
```

### 功能

#### 用户端登录

```
/login
```

#### 管理端

```
/admin # 用户名与密码admin/admin
```

- 后台相关配置

```
见 config/admin.php
```


### TODO

```
图片放七牛
```
