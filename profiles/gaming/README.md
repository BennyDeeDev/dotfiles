# Ryujinx

Ryujinx configuration is host-local and managed through the UI.

1. Install and launch the Ryujinx Flatpak.
2. Import locally obtained `prod.keys` and firmware through Ryujinx.
3. Add the host's `${my.gaming.gamesPath}/Switch` directory to the game list.
4. Configure controller bindings and resolution per host.
5. Re-import keys or firmware manually when updating versions.

Home Manager only installs Ryujinx, grants access to the Switch directory, and
creates that directory. It does not manage Ryujinx's mutable configuration,
keys, firmware, controller mappings, or graphics settings.

# Steam ROM Manager

1. Open Steam ROM Manager once on each host.
2. Set the host's Steam Directory and ROMs Directory in Settings.
3. Enable the required parsers and generate the app list.
