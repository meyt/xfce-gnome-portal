PACKAGE_NAME=xfce-gnome-portal
BUILD_DIR=build

all: clean build

build:
	mkdir -p $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN
	mkdir -p $(BUILD_DIR)/$(PACKAGE_NAME)/usr/share/xdg-desktop-portal

	# Copy Control & Maintainer Scripts
	cp DEBIAN/control $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN/
	cp DEBIAN/postinst $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN/
	cp DEBIAN/postrm $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN/

	# Portal Config (To tell GIO/Chrome to use GNOME backends)
	cp portals.conf $(BUILD_DIR)/$(PACKAGE_NAME)/usr/share/xdg-desktop-portal/xfce-portals.conf

	chmod 755 $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN/postinst
	chmod 755 $(BUILD_DIR)/$(PACKAGE_NAME)/DEBIAN/postrm

	dpkg-deb --build $(BUILD_DIR)/$(PACKAGE_NAME)

clean:
	rm -rf $(BUILD_DIR) || true
