import Alpine from 'alpinejs'
import Pristine from 'pristinejs'
import intersect from '@alpinejs/intersect'
import focus from '@alpinejs/focus'
import collapse from '@alpinejs/collapse'

window.Alpine = Alpine


document.querySelectorAll('PREPARE_LOWERVENDOR_js_pristine').forEach((form) => {
    var pristine = new Pristine(form, {
        classTo: 'PREPARE_LOWERVENDOR_formgroup',
        errorClass: 'PREPARE_LOWERVENDOR_formgroup--has-error',
        successClass: 'PREPARE_LOWERVENDOR_formgroup--has-success',
        errorTextParent: 'PREPARE_LOWERVENDOR_formgroup',
        errorTextTag: 'div',
        errorTextClass: 'PREPARE_LOWERVENDOR_formgroup__validation-result PREPARE_LOWERVENDOR_formgroup__validation-result--error'
    })

    form.addEventListener('submit', function (e) {
        e.preventDefault()
        if (pristine.validate()) {
            form.submit()
        }
    })
})

Alpine.plugin(intersect)
Alpine.plugin(focus)
Alpine.plugin(collapse)


Alpine.store('PREPARE_LOWERVENDOR_page', {
    scrolled: true,
    menuOpen: false,
    langOpen: false,
    highlight: '',
    viewport: {
        size: 'mobile',
        class: 'PREPARE_LOWERVENDOR_page__viewport--mobile',
        width: 0,
        height: 0
    },
    modal: {
        open: false,
        content: ''
    },
    info: {
        open: false,
        content: '',
        top: 0,
        left: 0,
        orientation: ''
    },
    street: {
        showcontent: false,
        pins: [],
        paddingBottom: 0,
        paddingTop: 0
    },

    isViewPort(viewports = []) {
        return viewports.includes(this.viewport.size)
    },

    getTop(element) {
        switch (element) {
            case 'PREPARE_LOWERVENDOR_page__gestern':
                if (this.street.pins[element]) {
                    return (this.street.pins[element].top - 28) + 'px'
                }
                return 0
            default:
                if (this.street.pins[element]) {
                    return this.street.pins[element].top + 'px'
                }
                return 0
        }
    },

    getLeft(element) {
        if (this.street.pins[element]) {
            return this.street.pins[element].left + 'px'
        }
        return 0
    },

    computeInfoPositions(street) {
        const subs = ['PREPARE_LOWERVENDOR_page__gestern', 'PREPARE_LOWERVENDOR_page__heute', 'PREPARE_LOWERVENDOR_page__morgen']
        const streetBox = street.querySelector('.PREPARE_LOWERVENDOR_street__image').getBoundingClientRect()
        subs.forEach(id => {
            this.street.pins[id] = {}
            if (this.isViewPort(['medium', 'large', 'wide'])) {
                const pin = document.getElementById(id)
                if (pin) {
                    const pinBox = pin.getBoundingClientRect()
                    this.street.pins[id].top = parseInt(pinBox.top - streetBox.top)
                    this.street.pins[id].left = parseInt(pinBox.left - streetBox.left)
                    this.street.pins[id].bottom = parseInt(streetBox.byottom - pinBox.bottom)
                    this.street.pins[id].right = parseInt(pinBox.right - streetBox.right)
                }
                let content = document.getElementById(id + '-content')
                if (content) {
                    let contentBox = content.getBoundingClientRect()
                    switch (id) {
                        case 'PREPARE_LOWERVENDOR_page__gestern':
                            this.street.paddingTop = (contentBox.height > this.street.pins[id].top ? contentBox.height - this.street.pins[id].top : 0)
                            break
                        case 'PREPARE_LOWERVENDOR_page__heute':
                            this.street.paddingBottom = contentBox.height - (streetBox.height - this.street.pins[id].top) + 30
                            break
                        case 'PREPARE_LOWERVENDOR_page__morgen':
                            let morgenPadding = contentBox.height - (streetBox.height - this.street.pins[id].top) + 30
                            if (morgenPadding > this.street.paddingBottom) {
                                this.street.paddingBottom = morgenPadding
                            }
                            break
                    }
                }
            } else {
                this.street.pins[id].top = 0
                this.street.pins[id].left = 0
                this.street.pins[id].bottom = 0
                this.street.pins[id].right = 0
                this.street.paddingBottom = 0
                this.street.paddingTop = 0
            }
        })
    },

    initializeStreet(street) {
        this.computeInfoPositions(street)
        window.addEventListener('resize', (e) => {

            this.computeInfoPositions(street)
        })
    },

    openModal(contentReference, event, element) {
        if (false) {
            this.modal.content = contentReference.innerHTML
            this.modal.open = true
        } else {
            switch (element.id) {
                case 'gestern':
                    this.info.orientation = 'PREPARE_LOWERVENDOR_info--top-right'
                    break
                case 'heute':
                    this.info.orientation = 'PREPARE_LOWERVENDOR_info--bottom-right'
                    break
                case 'morgen':
                    this.info.orientation = 'PREPARE_LOWERVENDOR_info--bottom-left'
                    break
            }
            this.info.open = false
            const position = this.cumulativeOffset(element)
            this.info.top = position.top
            this.info.left = position.left
            this.info.content = contentReference.innerHTML
            this.info.open = true
        }
    },


    cumulativeOffset(el) {
        const rect = el.getBoundingClientRect()
        return {
            left: rect.left + window.scrollX,
            top: rect.top + window.scrollY
        }
    },

    checkViewport(e = null) {
        if (e) {
            this.viewport.width = e.target.innerWidth
            this.viewport.height = e.target.innerHeight
        } else {
            this.viewport.width = window.innerWidth
            this.viewport.height = window.innerHeight
        }
        let viewportSize = 'wide'
        if (this.viewport.width < 576) {
            viewportSize = 'mobile'
        } else if (this.viewport.width < 768) {
            viewportSize = 'small'
        } else if (this.viewport.width < 1024) {
            viewportSize = 'medium'
        } else if (this.viewport.width < 1440) {
            viewportSize = 'large'
        }
        this.viewport.size = viewportSize
        this.viewport.class = 'PREPARE_LOWERVENDOR_page__viewport--' + viewportSize

    }
})

Alpine.start()
Alpine.store('PREPARE_LOWERVENDOR_page').checkViewport()

window.addEventListener('resize', (e) => {
    Alpine.store('PREPARE_LOWERVENDOR_page').checkViewport(e)
})

