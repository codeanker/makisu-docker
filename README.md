# makisu docker image

This image works with jenkins kubernets plugin. It contains the busbox binary, because jenkins want to check with the health with touch and sleep of the pipeline. Makisu deletes the whole filesystem on startup, exept some whitelisted directories. One of the directories is .dockerinit. This is the reason i saved the busybox binaries in this path. A little hacky, but it works.
