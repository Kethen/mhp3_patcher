TAG="mhp3_patcher_pspsdk"

if ! podman image exists $TAG
then
	podman image build -t $TAG -f Dockerfile
fi

podman run \
	--rm -it \
	-v ./:/work_dir \
	-w /work_dir \
	$TAG \
	-c "
make clean
make
"
