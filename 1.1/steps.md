$ docker run -d nginx
69c2ca8851082a89618465cd168547815fbe887d55ba05b935b705dd387f5418
$ docker run -d nginx
f1f6114f902bd28c06bc4559d7728cd66c40e0cf811d1d102015c2d37ffb19a4
$ docker run -d nginx
e6943750f531db6c9ab19b2f76ff440ab1242383b6803a8d6660a414131773cd
$ docker stop f1f e69
f1f
e69
$ docker ps -a
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
e6943750f531 nginx "/docker-entrypoint.…" 2 minutes ago Exited (0) 44 seconds ago heuristic_lewin
f1f6114f902b nginx "/docker-entrypoint.…" 2 minutes ago Exited (0) 44 seconds ago charming_archimedes
69c2ca885108 nginx "/docker-entrypoint.…" 2 minutes ago Up 2 minutes 80/tcp peaceful_blackburn