import axios from "axios";

export const apiClient = axios.create({
    baseURL: "http://localhost:80/api/",
    responseType: 'json',
    headers: {
        'Content-Type': 'application/json'
    } 
})
