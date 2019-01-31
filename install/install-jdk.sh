function install-jdk {
    if [ "$#" != "2" ]; then
        echo "Arguments: jdk-name jdk-file"
        return
    fi

    jdk=$1
    jdk_file=$2
    dest_dir=/opt
    
    sudo tar -xvzf $jdk_file --directory $dest_dir
    
    sudo update-alternatives --install /usr/bin/java java $dest_dir/$jdk/jre/bin/java 1
    sudo update-alternatives --config java
    
    sudo chown --recursive yankov $dest_dir/$jdk
    
    echo "Installation successful"
}