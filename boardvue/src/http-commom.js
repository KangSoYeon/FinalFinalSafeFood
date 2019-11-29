import axios from 'axios';

export default axios.create({
    baseURL : 'http://localhost:8197/safefood',
    headers:{
        'Content-type':'application/json'
    }
})