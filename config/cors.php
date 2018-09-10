<?php
return [
     /*
     |--------------------------------------------------------------------------
     | Laravel CORS
     |--------------------------------------------------------------------------
     |
     | allowedOrigins, allowedHeaders and allowedMethods can be set to array('*')
     | to accept any value.
     |
     */
    'supportsCredentials' => true,
    'allowedOrigins' => ['*'],
    'allowedHeaders' => ['Origin', 'Content-Type', 'Cookie' ,'X-CSRF-TOKEN', 'Accept', 'Authorization'],
    // 'allowedMethods' => ['GET', 'POST', 'PUT',  'DELETE', 'OPTIONS'],// ex: ['GET', 'POST', 'PUT',  'DELETE']
    'exposedHeaders' => ['Authorization', 'authenticated'],
    'maxAge' => 0,
];