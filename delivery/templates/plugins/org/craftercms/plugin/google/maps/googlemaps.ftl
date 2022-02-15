<#--
  ~ MIT License
  ~
  ~ Copyright (c) 2018-2022 Crafter Software Corporation. All Rights Reserved.
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  -->

<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign apiKey = pluginConfig.getString("apiKey", "")/>
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
