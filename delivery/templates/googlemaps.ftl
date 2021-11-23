<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign apiKey = siteConfig.getString("plugins.googleMaps.apiKey", "")/>
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

<#if contentModel.markerLocation_s?has_content>
    <#assign params += ["q=" + contentModel.markerLocation_s]/>
</#if>

<@crafter.div class="googlemaps-container">
  <#if apiKey?has_content>
    <@crafter.iframe
      $model=""
      allow="fullscreen"
      width="${contentModel.width_s}"
      height="${contentModel.height_s}"
      style="border: 0"
      src="https://www.google.com/maps/embed/v1/place?key=${apiKey}&${params?join('&')}"
    />
  <#else>
    <div style="
      color: #000;
      width: ${contentModel.width_s};
      height: ${contentModel.height_s};
      background-color: #f2f2f2;
      display: flex;
      align-items: center;
      justify-content: center;"
    >
      <span>The Google Maps plugin requires an API key, please follow the <a target="_blank" href="https://github.com/craftercms/googlemaps-plugin#setup">instructions</a> to configure it.</span>
    </div>
  </#if>
</@crafter.div>
