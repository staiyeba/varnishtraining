<?php
header("Vary: Accept-language");
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
?>
<h1>Exercise 8</h1>
<h2>Invalidate cache &amp; cache variations</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
echo 'Language: '.$_SERVER['HTTP_ACCEPT_LANGUAGE'].'<br/>';
?>
<a href="/">Back to index</a>