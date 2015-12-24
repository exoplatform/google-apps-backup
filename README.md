# Google apps backup Container
This is work in progress to test [Brive](https://github.com/wk8/Brive) to backup a google apps domain.

## Usage
### Build Container
```
git clone https://github.com/exoplatform/google-apps-backup.git
cd google-apps-backup/app
docker build -t brive .
```
### Configure the domain for the backup
Follow the https://github.com/wk8/Brive procedure.
Actually, there is PR in validation state updating this procedure : https://github.com/arcan1s/Brive

### Configure Brive
* Create a configuration directory
* Create the configuration file from the template
```
docker run --rm -v <config_dir>:/config brive cp /brive/settings.yml.tpl /config/settings.yml
```
* Copy the p12 file created during the domain configuration
* Edit the ``settings.xml`` file
** set your specific options
** change root_dir to ``'/data/'``


### Run brive
```
docker run -ti -v <config_dir>:/config -v <data_dir>:/data brive -v
```
