resource "google_project_iam_custom_role" "Deployer" {
  role_id     = "Deployer"
  title       = "Deployer"
  description = "Min. permissions to deploy"
  permissions = ["storage.buckets.create",
                  "storage.buckets.delete",
                  "storage.buckets.get",
                  "storage.buckets.list",
                  "storage.buckets.update",
                  "storage.objects.create",
                  "storage.objects.delete",
                  "storage.objects.get",
                  "storage.objects.list",
                  "storage.objects.update"]
}