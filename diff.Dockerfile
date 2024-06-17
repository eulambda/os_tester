FROM --platform=amd64 ubuntu:20.04 as base

# install packages
RUN apt update
RUN apt install -y git
WORKDIR /app
COPY to-copy/xv6_submission_original.tar .
COPY to-copy/xv6_submission.tar .
COPY to-copy/diff.sh .
RUN chmod +x ./diff.sh
ENTRYPOINT ["./diff.sh"]