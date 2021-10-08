import initializeBasicAuth from 'nextjs-basic-auth'
const users = [
  { user: 'user', password: 'pass' }
]
export default initializeBasicAuth({
  users: users
})