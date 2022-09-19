Name        : streambox_react_webui
Version     : 0.0.0
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

%build
echo Building %{name}-%{version}-%{release}
mkdir -p "%{buildroot}"

%install
install -d -m 0755 %{buildroot}
tar -x -p -z -f %{SOURCE0} -C %{buildroot}

%pre

%post
if [ -e /var/www/html/index.html ]; then
	DATET=$(date +%y%m%d_%H%M)
	mv /var/www/html/index.html /var/www/html/index.${DATET}.html
fi

%preun

%postun

%files
"/var/local/WebData/templates/Colorful Dev Template"
"/var/local/WebData/templates/Colorful Prod Template (Default)"
"/var/local/WebData/templates/Dark Dev Template"
"/var/local/WebData/templates/Dark Prod Template (Default)"
"/var/local/WebData/templates/Dev Audio Levels"
"/var/local/WebData/templates/Light Dev Template"
"/var/local/WebData/templates/Light Prod Template (Default)"
"/var/local/WebData/templates/Multiplex Light Dev Template"
"/var/local/WebData/templates/Multiplex Production Light"

%attr(-,root,root) /var/www/html/*

%changelog

* Fri Aug 5 2022 Heiichiro NAKAMURA <heiichiro.nakamura@streambox.com> 0.0.2
- updated

* Fri Aug 5 2022 Heiichiro NAKAMURA <heiichiro.nakamura@streambox.com> 0.0.1
- initial package
