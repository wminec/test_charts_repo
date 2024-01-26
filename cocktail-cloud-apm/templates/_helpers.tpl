{{/*
Expand the name of the chart.
*/}}
{{- define "openmaru-apm.name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openmaru-apm.fullname" -}}
{{- if .Values.global.fullnameOverride }}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.global.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openmaru-apm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openmaru-apm.labels" -}}
helm.sh/chart: {{ include "openmaru-apm.chart" . }}
{{ include "openmaru-apm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openmaru-apm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openmaru-apm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "openmaru-apm.serviceAccountName" -}}
{{- if .Values.global.serviceAccount.create }}
{{- default (include "openmaru-apm.fullname" .) .Values.global.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.global.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "openmaru-apm.ingress.apiVersion" -}}
{{- if and ($.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) }}
{{- print "networking.k8s.io/v1" }}
{{- else if $.Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" }}
{{- print "networking.k8s.io/v1beta1" }}
{{- else }}
{{- print "extensions/v1beta1" }}
{{- end }}
{{- end }}

{{/*
Return if ingress is stable.
*/}}
{{- define "openmaru-apm.ingress.isStable" -}}
{{- eq (include "openmaru-apm.ingress.apiVersion" .) "networking.k8s.io/v1" }}
{{- end }}

{{/*
Return if ingress supports ingressClassName.
*/}}
{{- define "openmaru-apm.ingress.supportsIngressClassName" -}}
{{- or (eq (include "openmaru-apm.ingress.isStable" .) "true") (and (eq (include "openmaru-apm.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) }}
{{- end }}

{{/*
Return if ingress supports pathType.
*/}}
{{- define "openmaru-apm.ingress.supportsPathType" -}}
{{- or (eq (include "openmaru-apm.ingress.isStable" .) "true") (and (eq (include "openmaru-apm.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) }}
{{- end }}


{{/*
Create imagePullSecrets if global.createImagePullSecret.create is true
*/}}
{{- define "openmaru-apm.imagePullSecret" -}}
{{- if .Values.global.imagePullSecret.create }}
{{- $registry := .Values.global.imageRegistry }}
{{- $username := .Values.global.registryCredentials.username }}
{{- $password := .Values.global.registryCredentials.password }}
{{- $email := .Values.global.registryCredentials.email }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" $registry $username $password $email (printf "%s:%s" $username $password | b64enc) | b64enc }}
{{- end }}
{{- end }}


{{/*
openmaru-apm image
*/}}
{{- define "openmaru-apm.omApm.image" -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.omApm.image.repository .Values.omApm.image.tag | trimSuffix "/" }}
{{- end }}

{{/*
influxdb image
*/}}
{{- define "openmaru-apm.influxdb.image" -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.influxdb.image.repository .Values.influxdb.image.tag | trimSuffix "/" }}
{{- end }}

{{/*
mongodb image
*/}}
{{- define "openmaru-apm.mongodb.image" -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.mongodb.image.repository .Values.mongodb.image.tag | trimSuffix "/" }}
{{- end }}

{{/*
rabbitmq image
*/}}
{{- define "openmaru-apm.rabbitmq.image" -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.rabbitmq.image.repository .Values.rabbitmq.image.tag | trimSuffix "/" }}
{{- end }}

{{/*
redis image
*/}}
{{- define "openmaru-apm.redis.image" -}}
{{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.redis.image.repository .Values.redis.image.tag | trimSuffix "/" }}
{{- end }}

