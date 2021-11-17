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

<#if modePreview>
  <style>
    .craftercms-ice-on .craftercms-googlemaps-plugin-container {
      position: relative;
    }

    .craftercms-ice-on .craftercms-googlemaps-plugin-container::before {
      content: '';
      position: absolute;
      display: inline-block;
      width: ${contentModel.width_s};
      height: ${contentModel.height_s};
    }

    .craftercms-ice-on .craftercms-googlemaps-plugin-container.z-pressed::before {
      background-color: rgba(50, 50, 50, 0.8);
    }

    .craftercms-ice-on .craftercms-googlemaps-plugin-container.z-pressed::after {
      content: 'Switch off Edit mode to interact with map.';
      position: absolute;
      display: inline-block;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      color: white;
      font-weight: bold;
      text-align: center;
    }
  </style>
</#if>

<@crafter.div>
  <#if apiKey?has_content>
    <div class="craftercms-googlemaps-plugin-container">
      <iframe
        allowfullscreen="true"
        width="${contentModel.width_s}"
        height="${contentModel.height_s}"
        frameborder="0" style="border:0"
        src="https://www.google.com/maps/embed/v1/place?key=${apiKey}&${params?join('&')}"
      ></iframe>
    </div>
  <#else>
    The Google Maps plugin requires an API key, please follow the
    <a target="_blank" href="https://github.com/craftercms/googlemaps-plugin#setup">instructions</a> to configure it.
  </#if>
</@crafter.div>

<script>
  window.addEventListener('DOMContentLoaded', () => {
    const onKeyup = (e) => {
      if (e.key === 'z') {
        document.querySelector('.craftercms-googlemaps-plugin-container').classList.remove('z-pressed');
      }
    };
    const onKeydown = (e) => {
      if (e.key === 'z') {
        document.querySelector('.craftercms-googlemaps-plugin-container').classList.add('z-pressed');
      }
    };

    document.addEventListener('keydown', onKeydown, false);
    document.addEventListener('keyup', onKeyup, false)
  });
</script>
