# Google Maps Plugin for Crafter CMS

This is a highly configurable plugin to add Google Maps to your site.

# Installation

The plugin can be installed to your site from the Crafter CMS Marketplace

# Setup

After the plugin has been installed you need to setup your Google Maps API Key by adding the following snippet in
your `Engine Site Configuration` file:

```xml
<plugins>
  <googleMaps>
    <apiKey>...</apiKey>
  </googleMaps>
</plugins>
```

# Usage

Once the API Key is properly configured you can create any number of Google Maps components as needed. Each instance
of the component can be configured with any of the properties supported by Google Maps, for more information about
the options see the
[official docs](https://developers.google.com/maps/documentation/embed/embedding-map#choosing_map_modes).
