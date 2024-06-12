FROM --platform=amd64 ubuntu:20.04 as base

# install packages
RUN apt update
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt install -y qemu-system-x86
RUN apt install -y git build-essential
# clone xv6
WORKDIR /app
RUN git clone -b project3 https://github.com/s3yonsei/csi3101-xv6.git
WORKDIR /app/csi3101-xv6

# sync .vimrc
COPY to-copy/xv6_submission.tar .
RUN tar -xvf xv6_submission.tar
COPY to-copy/test_src/ ./
COPY to-copy/tester.sh .
RUN chmod +x ./tester.sh
# make deps of qemu
RUN make fs.img xv6.img

FROM base as tester
ENTRYPOINT ["./tester.sh","obj1_1_test","obj1_2_test","obj1_3_test","obj1_4_test","obj2_1_test","obj2_2_test","obj2_3_test","obj2_4_test","obj3_1_test","obj3_2_test"]
