const searchFilter = document.getElementById('filter')

let userinfo = []

const getUsers = async () => {
  const { data } = await axios.get('https://randomuser.me/api/?results=1000')
  const { results } = data
  const userCards = document.querySelectorAll('.user-card')
  userCards.forEach((eachCard) => eachCard.remove())
  results.map((user) => {
    showUser(user)
    userinfo.push(user)
  })
}

getUsers()

function showUser(userDetails) {
  const userList = document.querySelector('.user-list')
  const user = ` 
                <img class="user-image" src="${userDetails.picture.medium}" alt="user">
                <div class="user-info">
                     <h4>${userDetails.name.title} ${userDetails.name.first} ${userDetails.name.last}</h4>
                    <p>${userDetails.location.city}${userDetails.location.state},${userDetails.location.country}</p> 
                </div>    
           `

  const userCard = document.createElement('li')
  userCard.classList.add('user-card')
  userCard.innerHTML = user
  userList.appendChild(userCard)
}

searchFilter.addEventListener('input', () => {
  const userCards = document.querySelectorAll('.user-card')
  userCards.forEach((eachCard) => eachCard.remove())
  userinfo.forEach((user) => {
    const str = user.name.first + user.name.last + user.name.title
    if (str.includes(searchFilter.value)) {
      showUser(user)
    }
  })
})
