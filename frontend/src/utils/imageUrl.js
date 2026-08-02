export const getImageUrl = path => {
    if (!path) return ''

    if (
        /^https?:\/\//i.test(path) ||
        path.startsWith('blob:') ||
        path.startsWith('data:')
    ) {
        return path
    }

    const apiBase = (import.meta.env.VITE_API_URL || '').replace(/\/+$/, '')
    const backend = apiBase.endsWith('/api') ? apiBase.slice(0, -4) : apiBase

    return `${backend}/storage/${path}`
}
