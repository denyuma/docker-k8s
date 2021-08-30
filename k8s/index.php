<html>
<body>
Your IP <?php echo $_SERVER['REMOTE_ADDR'] ?>�B
<br>
Welcome to Kubernetes.
<br>
<?php echo gethostname() ?>
<br>
<?php
$cntfile = '/var/data/cnt.txt';
if (!file_exists($cntfile)) {
        //  �t�@�C�����Ȃ��Ƃ�
        $value = 1;
        $fp = file_put_contents($cntfile, $value . "\n", LOCK_EX);
} else {
        $fp = fopen($cntfile, 'r+');
        if (flock($fp, LOCK_EX)) {
                $value = intval(trim(fgets($fp)));
                $value++;
                ftruncate($fp, 0);
                fputs($fp, $value . "\n");
                flock($fp, LOCK_UN);
        } else {
                echo ('error');
                exit();
        }
        fclose($fp);
}
echo('Access = ' . $value);
?>
</body>
</html>