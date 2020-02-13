# shared/java_openjdk #

Installs OpenJDK Java.

- Supports versions: 6, 7, 8.
- Supports modes: jdk, jre-headless, jre.
- Supports installation from ppa:openjdk-r/ppa (required to install version 8).
- Creates `/usr/lib/jvm/default-java` alias pointing to installation directory

## Requirements ##

This role requires Ansible 2.0 or higher.

## Role Variables ##

### Defaults ###

    - name: java_openjdk_version
      desc: Version of OpenJDK Java to install
      default: 8

    - name: java_openjdk_package
      desc: Type of package to install 'jdk', 'jre' or 'jre-headless'
      default: jre-headless

    - name: java_openjdk_use_ppa
      desc: Whether to use the OpenJDK-R Java PPA repository
      default: true

### Vars ###

These are not meant to be modified, but can be used by other roles.

    - name: java_openjdk_jvm_path
      desc: System path to JVMs
      value: "/usr/lib/jvm"

    - name: java_openjdk_dir
      desc: Name of the directory in which Java is installed
      value: "java-{{ java_openjdk_version }}-openjdk-amd64"

    - name: java_openjdk_java_bin
      desc: Location of the java executable
      value: "{{ java_openjdk_jvm_path }}/{{ java_openjdk_dir }}/jre/bin/java"

    - name: java_openjdk_default_java_link
      desc: Path to `default-java` alias
      value: "{{ java_openjdk_jvm_path }}/default-java"

    - name: java_openjdk_package_name
      desc: Name of the package to be installed
      value: "openjdk-{{ java_openjdk_version }}-{{ java_openjdk_package }}"

## Dependencies ##

None.

## Example Playbook ##

Install OpenJDK Java 8 (headless, JRE-only, from PPA):

    - hosts: all
      roles:
        - role: shared/java_openjdk

Install OpenJDK Java 7 (complete, JRE-only, from PPA):

    - hosts: all
      roles:
        - role: shared/java_openjdk
          java_openjdk_version: 7
          java_openjdk_package: jre

Install OpenJDK Java 7 (JDK, from default source):

    - hosts: all
      roles:
        - role: shared/java_openjdk
          java_openjdk_version: 7
          java_openjdk_package: jdk
          java_openjdk_use_ppa: false

## License ##

BSD

## Author Information ##

Based on java role by Kevin Brebanov
