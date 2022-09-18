Name        : streambox_react_webui
Version     : 0.0.3
Release     : 1
BuildArch   : noarch
Group       : Applications/Multimedia
License     : Streambox SL
Vendor      : Streambox, Inc.
Packager    : info@streambox.com
URL         : https://www.streambox.com
Summary     : Streambox React-based webUI

Source0: streambox-react-webui.tgz

%description
	React-based webUI for Streambox Encoder/Decoder
	w/ REST API


%prep

[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}



# %setup -q

%build

echo Building %{name}-%{version}-%{release}
mkdir -p "%{buildroot}"


## %  configure


%install

install -d -m 0755 %{buildroot}/var/www/html/
tar -x -p -z -f %{SOURCE0}  -C %{buildroot}/var/www/html/


#  %clean
#  [ ${RPM_BUILD_ROOT} != "/" ] && rm -rf ${RPM_BUILD_ROOT}

# %check


%pre

%post

if [ -e /var/www/html/index.html ]; then
	DATET=$(date +%y%m%d_%H%M)
	mv /var/www/html/index.html /var/www/html/index.${DATET}.html
fi
# cp -p /var/www/html/index.react.html /var/www/html/index.html


%preun

%postun



%files

%attr(-,root,root) /var/www/html/*


## %license LICENSE

## %doc



%changelog

* Fri Aug 5 2022 Heiichiro NAKAMURA <heiichiro.nakamura@streambox.com> 0.0.2
- updated

* Fri Aug 5 2022 Heiichiro NAKAMURA <heiichiro.nakamura@streambox.com> 0.0.1
- initial package
