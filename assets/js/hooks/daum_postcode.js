/**
 * Daum Postcode Hook
 *
 * Integrates Daum (Kakao) postcode service for Korean address autocomplete.
 * No API key required, free for commercial use.
 *
 * Service documentation: https://postcode.map.daum.net/guide
 */

// Script loaded state
let scriptLoaded = false
let scriptLoading = false
const pendingCallbacks = []

// Load Daum postcode script dynamically
function loadDaumScript(callback) {
  if (scriptLoaded) {
    callback()
    return
  }

  if (scriptLoading) {
    pendingCallbacks.push(callback)
    return
  }

  scriptLoading = true

  const script = document.createElement('script')
  script.src = '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'
  script.async = true
  script.onload = () => {
    scriptLoaded = true
    scriptLoading = false
    callback()
    pendingCallbacks.forEach(cb => cb())
    pendingCallbacks.length = 0
  }
  script.onerror = () => {
    scriptLoading = false
    console.error('Failed to load Daum postcode script')
  }
  document.head.appendChild(script)
}

export const DaumPostcode = {
  mounted() {
    this.inputEl = this.el.querySelector('input[type="text"]')
    this.buttonEl = this.el.querySelector('[data-postcode-trigger]')

    // Load script on mount
    loadDaumScript(() => {
      // Script ready
    })

    // Handle button click
    if (this.buttonEl) {
      this.buttonEl.addEventListener('click', (e) => {
        e.preventDefault()
        this.openPostcode()
      })
    }

    // Handle input click (optional - open on input focus)
    if (this.inputEl && this.el.dataset.openOnFocus === 'true') {
      this.inputEl.addEventListener('focus', () => {
        this.openPostcode()
      })
    }

    // Handle phx events
    this.handleEvent('open-postcode', () => {
      this.openPostcode()
    })
  },

  openPostcode() {
    loadDaumScript(() => {
      new window.daum.Postcode({
        oncomplete: (data) => {
          // Parse the response data
          const addressData = {
            // Road address (도로명주소)
            roadAddress: data.roadAddress || data.autoRoadAddress || '',
            // Jibun address (지번주소)
            jibunAddress: data.jibunAddress || data.autoJibunAddress || '',
            // Postal code (우편번호)
            postalCode: data.zonecode || '',
            // Building name (건물명)
            buildingName: data.buildingName || '',
            // Sido (시/도)
            sido: data.sido || '',
            // Sigungu (시/군/구)
            sigungu: data.sigungu || '',
            // Bname (법정동/리)
            bname: data.bname || '',
            // English address
            roadAddressEnglish: data.roadAddressEnglish || '',
            jibunAddressEnglish: data.jibunAddressEnglish || '',
            // Apartment flag
            apartment: data.apartment === 'Y'
          }

          // Format display address
          let displayAddress = addressData.roadAddress
          if (addressData.buildingName) {
            displayAddress += ` (${addressData.buildingName})`
          }

          // Update input value
          if (this.inputEl) {
            this.inputEl.value = displayAddress
          }

          // Push event to LiveView
          this.pushEvent('address-selected', addressData)
        },
        onclose: (state) => {
          // state can be 'COMPLETE_CLOSE' or 'FORCE_CLOSE'
          if (state === 'FORCE_CLOSE') {
            // User closed without selecting
            this.pushEvent('address-cancelled', {})
          }
        },
        width: '100%',
        height: '100%'
      }).open({
        // Center the popup
        left: (window.innerWidth - 500) / 2,
        top: (window.innerHeight - 600) / 2
      })
    })
  },

  destroyed() {
    // Cleanup if needed
  }
}
