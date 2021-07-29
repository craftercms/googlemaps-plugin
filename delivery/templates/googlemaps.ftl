<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign apiKey = siteConfig.getString("plugins.googleMaps.apiKey")/>
<#assign params = []/>

<#if contentModel.center_s?has_content>
  <#assign params += ["center=" + contentModel.center_s]/>
</#if>

<#if contentModel.zoom_i?has_content>
  <#assign params += ["zoom=" + contentModel.zoom_i]/>
</#if>

<#if contentModel.mapType_s?has_content>
  <#assign params += ["maptype=" + contentModel.mapType_s]/>
</#if>

<#if contentModel.language_s?has_content>
  <#assign params += ["language=" + contentModel.language_s]/>
</#if>

<#if contentModel.region_s?has_content>
  <#assign params += ["region=" + contentModel.region_s]/>
</#if>

<#switch contentModel.mapMode_s>
  <#case "place">
    <#if contentModel.markerLocation_s?has_content>
      <#assign params += ["q=" + contentModel.markerLocation_s]/>
    </#if>
    <#break>
  <#case "directions">
    <#if contentModel.origin_s?has_content>
      <#assign params += ["origin=" + contentModel.origin_s]/>
    </#if>
    <#if contentModel.destination_s?has_content>
      <#assign params += ["destination=" + contentModel.destination_s]/>
    </#if>
    <#if contentModel.waypoints_s?has_content>
      <#assign params += ["waypoints=" + contentModel.waypoints_s]/>
    </#if>
    <#if contentModel.mode_s?has_content>
      <#assign params += ["mode=" + contentModel.mode_s]/>
    </#if>
    <#if contentModel.avoid_s?has_content>
      <#assign params += ["avoid=" + contentModel.avoid_s]/>
    </#if>
    <#if contentModel.units_s?has_content>
      <#assign params += ["units=" + contentModel.units_s]/>
    </#if>
    <#break>
  <#case "streetview">
    <#if contentModel.panoramaId_s?has_content>
      <#assign params += ["pano=" + contentModel.panoramaId_s]/>
    </#if>
    <#if contentModel.panoramaLocation_s?has_content>
      <#assign params += ["location=" + contentModel.panoramaLocation_s]/>
    </#if>
    <#if contentModel.heading_i?has_content>
      <#assign params += ["heading=" + contentModel.heading_i]/>
    </#if>
    <#if contentModel.pitch_i?has_content>
      <#assign params += ["pitch=" + contentModel.pitch_i]/>
    </#if>
    <#if contentModel.fov_i?has_content>
      <#assign params += ["fov=" + contentModel.fov_i]/>
    </#if>
    <#break>
  <#case "search">
    <#if contentModel.markerLocation_s?has_content>
      <#assign params += ["q=" + contentModel.markerLocation_s]/>
    </#if>
    <#break>
</#switch>

<#-- TODO: Handle page builder events to make sure the component is always editable -->
<@crafter.componentRootTag>
  <@crafter.iframe
    allowfullscreen="true"
    width="${contentModel.width_s}"
    height="${contentModel.height_s}"
    frameborder="0" style="border:0"
    src="https://www.google.com/maps/embed/v1/${contentModel.mapMode_s}?key=${apiKey}&${params?join('&')}"
  />
</@crafter.componentRootTag>
