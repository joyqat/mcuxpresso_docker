# DEPRECATED
Since NXP blocks unauthencated downloading now, this repo won't update any more.

# mcuxpresso_docker
This image is used for ci purpose.
You can run 
```shell
# /<buildConfig> can be omitted, or specified as Release, Debug or any config you specified in your project 
mcuxpressoide -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -importAll <workspaceDir> -cleanBuild <projectName>/<buildConfig>
```
to start a build.

For further infomation, you can visit https://www.nxp.com/support/developer-resources/software-development-tools/mcuxpresso-software-and-tools/mcuxpresso-integrated-development-environment-ide:MCUXpresso-IDE
