# Run Portainer in Docker or Podman

This repo allows you to quickly run Portainer within Docker or Podman. Portainer is a web interface to help manage docker resources and is useful to quickly remove unneeded resources to free up disk space.

---

Run Portainer in Docker: `make portainer-in-docker`

Run Portainer in Podman: `make portainer-in-podman`

The web interface will be available at http://localhost:9000/.

---

Upon first start you will be prompted to create Portainer's admin credentails. If you forget them, you can delete the data volume by running either `docker volume rm portainer_portainer_data` or `podman volume rm portainer_portainer_data` as appropriate.
