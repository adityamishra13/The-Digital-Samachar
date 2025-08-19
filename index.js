
window.onload = () => {
  const saved = localStorage.getItem("userSelection");
  let url = "https://saurav.tech/NewsAPI/";

  const result = document.getElementById("result");
  if (saved) {
    const data = JSON.parse(saved);
    console.log("User selection from localStorage:", data);

    const mainChoice = data.main;
    const subChoice = data.sub;

    if (mainChoice === "everything") {
      // console.log("Fetch news from source:", subChoice);
      url += mainChoice + "/" + subChoice;
      result.textContent = "Showing results for : Source " + " -> " + subChoice
    } else if (mainChoice === "top-headlines") {
      // console.log("Fetch top headlines for category:", subChoice);
      url += mainChoice + "/category/" + subChoice + "/in.json";
      result.textContent = "Showing results for : " + mainChoice + " -> " + subChoice
    }
    fetchnews(url)
  } else {
    console.log("No selection found in localStorage");
  }
};

function fetchnews(url) {
  fetch(url)
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      console.log(data)
      let count = 1
      const newsarea = document.getElementById("newsarea");

      for (let source of data.articles) {

        const newDiv = document.createElement("div");
        newDiv.innerText = count + ". ";
        newDiv.style.color = "green";
        newDiv.style.border = "1px green dotted"
        newDiv.style.margin = "10px"
        newDiv.style.padding = "10px"
        // newDiv.style.background="grey"

        let newstitle = document.createElement("div");
        newstitle.innerText = source.title;
        newstitle.style.color = "blue";
        newstitle.style.fontSize = "30px"

        let newsDesc = document.createElement("div")
        newsDesc.innerText = source.description + " - - - Author : " + source.author
        // newscontent.style = "italic";
        newsDesc.style.color = "black"
        newsDesc.style.fontSize = "15px"

        let newscontent = document.createElement("div");
        newscontent.innerText = source.content;
        newscontent.style.color = "black";
        newscontent.style.fontSize = "20px"
        if (newscontent.innerText.length > 105) {
          newscontent.innerText = newscontent.innerText.substr(0, 100) + "...";
        }


        let fullnews = document.createElement("a");
        fullnews.href = source.url;
        fullnews.textContent = " Read in Detail ..."
        fullnews.style.fontSize = "20px"
        fullnews.style.fontWeight = '900'
        fullnews.style.margin = "10px"

        let img = document.createElement("img");
        img.src = source.urlToImage;
        img.alt = "News Image";
        img.width = 100;

        newDiv.appendChild(newstitle)
        newDiv.appendChild(newsDesc)
        newDiv.appendChild(newscontent)
        newDiv.appendChild(img)
        newDiv.appendChild(fullnews)

        newDiv.style.backgroundColor = "white"

        newsarea.appendChild(newDiv);
        count++
      }


    })
    .catch(error => {
      console.error("Fetching error:", error);
    });
}