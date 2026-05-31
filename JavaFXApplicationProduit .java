package javafxapplicationproduit;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class JavaFXApplicationProduit extends Application {
    
    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("produit_view.fxml"));
        Parent root = loader.load();
        
        primaryStage.setTitle("Gestion des Produits");
        primaryStage.setScene(new Scene(root, 900, 700));
        primaryStage.setMinWidth(800);
        primaryStage.setMinHeight(600);
        primaryStage.show();
    }
    
    @Override
    public void stop() throws Exception {
        
        classes.ProduitService.closeSession();
        super.stop();
    }
    
    public static void main(String[] args) {
        launch(args);
    }
}
