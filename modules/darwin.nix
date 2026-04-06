{ config, pkgs, ... }:

{

home.packages = [
    pkgs.gvproxy
];
services.podman = {
        enable = true;
        machines = {
            "work"  = {
                cpus = 5;
                memory = 4096;
                diskSize = 100;
                autoStart = true;
                rootful = true;
            };
        };
        useDefaultMachine = false;
    };
}
