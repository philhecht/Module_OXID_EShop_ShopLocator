<?php
//COPY THIS into function.php
/**
 * @param $dir
 * @return array
 */
function getMarkerimages($dir)
{
    $marker = array();
    if (is_dir($dir)) {
        $open_dir = opendir($dir);
        while ($file = readdir($open_dir)) {
            if ($file != "." && $file != "..") {
                if (strstr($file, ".gif") || strstr($file, ".GIF") || strstr($file, ".JPG") || strstr(
                        $file,
                        ".jpg"
                    ) || strstr($file, ".PNG") || strstr($file, ".png")
                ) {

                    $marker[] = $file;

                }
            }
        }
        closedir($open_dir);
        return $marker;
    } else {
        echo "Das Verzeichnis \"" . $dir . "\" existiert nicht!";
    }

}
