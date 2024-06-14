#/bin/bash
echo "checksum:"
cksum ./to-copy/xv6_submission.tar
git clone -b project3 https://github.com/s3yonsei/csi3101-xv6.git
cd ./csi3101-xv6/
cp ../to-copy/xv6_submission.tar .
tar -xvf xv6_submission.tar
make qemu-nox