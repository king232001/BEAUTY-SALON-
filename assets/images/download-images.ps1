$ErrorActionPreference = "Stop"

$images = @(
  @{ Name = "hero.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=1920&q=80",
    "https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?auto=format&fit=crop&w=1920&q=80"
  )},
  @{ Name = "about-team.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "about-client.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-women-hair.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1600948836101-f9ffda59d250?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-men-hair.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1622286342621-4bd786c2447c?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1517832606299-7ae9b720a186?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-makeup.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1596704017254-9f8f7b7f9061?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-manicure.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1519014816548-bf5fe059798b?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1604654894610-df63bc536371?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-pedicure.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1596704017254-9f8f7b7f9061?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1607779097040-26e80aa78e66?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-facial.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-spa.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "service-bridal.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1469334031218-e382a71b716b?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-1.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1562322140-8baeececf3df?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-2.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1605497788044-5a32c7078486?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1633681926035-ec1ac984418a?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-3.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1595475884562-073c30d45670?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1621605815971-fbc98d665033?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-4.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1522338140262-f46f5913618a?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1560869713-da86a9ec94ef?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-5-afro.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1519699047748-de8e457a634e?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1595475884562-073c30d45670?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "gallery-6-afro.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1621605815971-fbc98d665033?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1633681926035-ec1ac984418a?auto=format&fit=crop&w=1600&q=80"
  )},
  @{ Name = "contact-salon.jpg"; Urls = @(
    "https://images.unsplash.com/photo-1562322140-8baeececf3df?auto=format&fit=crop&w=1600&q=80",
    "https://images.unsplash.com/photo-1600948836101-f9ffda59d250?auto=format&fit=crop&w=1600&q=80"
  )}
)

foreach ($item in $images) {
  $target = Join-Path $PSScriptRoot $item.Name
  $downloaded = $false

  foreach ($url in $item.Urls) {
    try {
      Invoke-WebRequest -Uri $url -OutFile $target
      Write-Output "Downloaded: $($item.Name)"
      $downloaded = $true
      break
    } catch {
      Write-Warning "Failed: $($item.Name) via $url"
    }
  }

  if (-not $downloaded) {
    Write-Error "Unable to download $($item.Name) from all URLs"
  }
}

Write-Output "Done. Images saved in $PSScriptRoot"
