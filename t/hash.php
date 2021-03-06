<?php

$context = hash_init("md5");
hash_update($context, "data");

$copy_context = hash_copy($context);

echo hash_final($context), "\n";

hash_update($copy_context, "data");

echo hash_final($copy_context);

$expected  = crypt('12345', '$2a$07$usesomesillystringforsalt$');
$correct   = crypt('12345', '$2a$07$usesomesillystringforsalt$');
$incorrect = crypt('apple', '$2a$07$usesomesillystringforsalt$');

var_dump(hash_equals($expected, $incorrect));
var_dump(hash_equals($expected, $correct));

file_put_contents('example.txt', 'The fuck');

echo hash_file('md5', 'example.txt');

echo '</br>';

$ctx = hash_init("sha1");
hash_update($ctx, 'the quick brown fox jumped over the lazy dog.');
echo hash_final($ctx);

echo '</br>';

$pwd = password_hash("123456", PASSWORD_DEFAULT);
echo $pwd;
echo '</br>';
var_dump(password_get_info($pwd));
// echo password_get_info($pwd);
//
echo '</br>';

if (password_verify('123456', $pwd)) {
    echo "验证成功";
}

$hash = '$2y$07$BCryptRequires22Chrcte/VlQH0piJtjXl.0t1XkA8pw9dMXTpOq';

if (password_verify('rasmuslerdorf', $hash)) {
    echo 'Password is valid!';
} else {
    echo 'Invalid password.';
}
