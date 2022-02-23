command:

Install global
sudo wget -O /usr/local/bin/docker-save-and-retag https://gist.github.com/stefanvangastel/d6b5b38e8716ea102b651c67c100225f/raw/b0b13deb46e9cae07458dcb66160c1e5994fd43c/docker-save-and-retag.sh && sudo chmod +x /usr/local/bin/docker-save-and-retag

Then use docker-save-and-retag instead of ./docker-save-and-retag.sh in examples

Example: Basic usage docker-save-and-retag.sh
./docker-save-and-retag.sh ubuntu:latest /mydir/ubuntu.tar my.private.registry/docker/ubuntu:latest

Example: Save and retag all local images as escaped_image_name.tar in /path/to/
docker images --format "{{.Repository}}:{{.Tag}}" | while read line ; do ./docker-save-and-retag.sh $line "/path/to/$(echo $line | sed -r 's/[\:\/]+/_/g').tar" "my.private.registry.com/$line" ; done

Example: Load and push all saved images in /path/to/*.tar
for file in /path/to/*.tar; do ./docker-load-and-push.sh $file --push; done