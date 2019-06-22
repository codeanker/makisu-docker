FROM gcr.io/makisu-project/makisu:v0.1.11 AS makisu

FROM gcr.io/cloud-builders/bazel:latest AS busybox
RUN git clone https://github.com/GoogleContainerTools/distroless.git
WORKDIR /distroless
RUN bazel build //experimental/busybox:busybox_tar
RUN tar -C /distroless/bazel-genfiles/experimental/busybox/ -xf /distroless/bazel-genfiles/experimental/busybox/busybox.tar

FROM scratch
COPY --from=makisu /makisu-internal /makisu-internal
COPY --from=1 /distroless/bazel-genfiles/experimental/busybox/busybox/ /.dockerinit/busybox/

ENV PATH /.dockerinit/busybox
CMD ["/.dockerinit/busybox/sh"]
