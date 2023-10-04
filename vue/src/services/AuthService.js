import axios from 'axios';

export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },

  landingPage(user) {
    return axios.post('/', user)
  },

  getLoggedInUsername() {
    return axios.get('/user/username')
  },

  getLoggedInUserInfo() {
    return axios.get('/currentuser/info')
  }


}
