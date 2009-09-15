<html>
<head>
<title>AppBenchmark Charts</title>
</head>
<body>
<H1>AppScale Benchmark</H1>

<font face=Georgia size=3>
<?php

$files = array();

$current_dir = dirname($_SERVER['PHP_SELF']);

if ($handle = opendir('.')) {
    echo "<ol>";
    while (false !== ($file = readdir($handle))) {
        if ($file == "hidden")  continue; 
        $ext = substr($file, -3, 3);
        if ($file != "." && $file != ".." && $ext != "php" && $ext != "swp") {
  					array_push($files, $file); 
        }
    }
		
		sort($files); 
		foreach($files as $file) {
      $ext = substr($file, -3, 3);
      if( $ext != "png") continue;
			echo "<li>$file <a href='$file'>link</a></li>\n";
		}

    //echo "<H2> Data </H2>";
		foreach($files as $file) {
      $ext = substr($file, -3, 3);
      if( $ext == "png") continue;
			echo "<li>$file <a href='$file'>link</a></li>\n";
		}

    echo "</ol>";
    closedir($handle);
}

//echo "<br>wget http://twolves.cs.ucsb.edu/appscale/appscale_scratch_install.sh</br></br>";
//echo "* Patch for AppDB interface and Configuration file for Cassandra<br>";
//echo "cd ~/appscale<br>";
//echo "wget http://twolves.cs.ucsb.edu/appscale/appscale_app_db_20090608.patch<br>";
//echo "patch -p1 < appscale_app_db_20090608.patch <br><br>";

?>
</font>
</body>
</html>
