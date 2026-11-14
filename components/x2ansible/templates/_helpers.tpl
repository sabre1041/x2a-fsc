{{/*
Expand the name of the chart.
*/}}
{{- define "x2ansible.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "x2ansible.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
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
{{- define "x2ansible.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "x2ansible.labels" -}}
helm.sh/chart: {{ include "x2ansible.chart" . }}
{{ include "x2ansible.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "x2ansible.selectorLabels" -}}
app.kubernetes.io/name: {{ include "x2ansible.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Vault API server URL. Uses the configured server when set, otherwise derives
it from the Vault namespace.
*/}}
{{- define "x2ansible.vault.server" -}}
{{- if .Values.setup.vault.server -}}
{{ .Values.setup.vault.server }}
{{- else -}}
{{ printf "https://vault.%s.svc.cluster.local:8200" .Values.setup.vault.namespace }}
{{- end -}}
{{- end }}
