{ config, pkgs, ... }:

{

home.packages = [
    pkgs.gvproxy
    pkgs.glab
];
services.podman = {
        enable = true;
        machines = {
            "work"  = {
                cpus = 5;
                memory = 8192;
                diskSize = 100;
                autoStart = true;
                rootful = true;
            };
        };
        useDefaultMachine = false;
    };
}
