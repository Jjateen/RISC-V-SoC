## Steps to Install TerosHDL

### 1. Install Ubuntu 18.04
- Use VMware Workstation Player or another virtualization tool.
- Download the ISO: [Ubuntu 18.04.6 LTS](https://releases.ubuntu.com/18.04/).
- Follow the installation guide: [How to Install Ubuntu on VMware Player](https://data-flair.training).

### 2. Install VSCode
- Follow this guide: [How to Install VSCode on Ubuntu](https://phoenixnap.com/kb/how-to-install-visual-studio-code-on-ubuntu).

### 3. Download OSS CAD Suite
- Download the binary: [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build/releases/tag/2023-07-06).
- Extract the compressed file.
- Add the environment variable:
  ```bash
  nano ~/.bashrc
  ```
  Append the following line:
  ```bash
  alias oss='source {YOUR_INSTALL_DIR}/oss-cad-suite/environment'
  ```

### 4. Install TerosHDL Extension
- Open VSCode: `code .`
- Go to Extensions, search for "TerosHDL," and install it.

---

For a more detailed tutorial, check out the original article: [Building the Ultimate FPGA/ASIC Front-End Design IDE](https://medium.com/@mnasser431998/building-the-ultimate-fpga-asic-front-end-design-ide-9023eb5808e0)
