provider "google" {
    project = "cloudrun-envoy-sample"
}

resource "google_cloud_run_service" "default" {
    name     = "web"
    location = "asia-northeast1"

    metadata {
      annotations = {
        "run.googleapis.com/client-name" = "terraform"
      }
    }

    template {
      spec {
        containers {
          image = "asia-northeast1-docker.pkg.dev/cloudrun-envoy-sample/web/hono-app:latest"
        }
      }
    }
 }

 data "google_iam_policy" "noauth" {
   binding {
     role = "roles/run.invoker"
     members = ["allUsers"]
   }
 }

 resource "google_cloud_run_service_iam_policy" "noauth" {
   location    = google_cloud_run_service.default.location
   project     = google_cloud_run_service.default.project
   service     = google_cloud_run_service.default.name

   policy_data = data.google_iam_policy.noauth.policy_data
}