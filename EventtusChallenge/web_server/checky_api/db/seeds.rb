#i added some valid Gems, oses and system libararies
# if you need the full list please check the following link
# https://github.com/teohm/natives/blob/master/catalogs/rubygems.yaml
rgem1 = Rgem.create(name: "capybara-webkit", version: 0.0)

linux = Osystem.create(name: "Linux",
                          install_code: "apt-get install")

systemlib1 = Systemlib.create(name: "libqtwebkit-dev")

information1 = Information.create(rgem_id:      rgem1.id,
                                  osystem_id:   linux.id,
                                  systemlib_id: systemlib1.id
                                  )

mac = Osystem.create(name: "mac_os_x",
                          install_code: "homebrew")

systemlib2 = Systemlib.create(name: "qt")

information2 = Information.create(rgem_id:      rgem1.id,
                                  osystem_id:   mac.id,
                                  systemlib_id: systemlib2.id
                                  )

charlock_holmes = Rgem.create(name: "charlock_holmes", version: 0.0)

libicu = Systemlib.create(name: "libicu-dev")

icu4c = Systemlib.create(name: "icu4c")

information1 = Information.create(rgem_id:      charlock_holmes.id,
                                  osystem_id:   linux.id,
                                  systemlib_id: libicu.id
                                  )

information1 = Information.create(rgem_id:      charlock_holmes.id,
                                  osystem_id:   mac.id,
                                  systemlib_id: icu4c.id
                                 )
